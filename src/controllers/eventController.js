const EventModel = require('../models/eventModel');

const getAllEvents = async (req, res) => {
    try {
        const { name } = req.query;
        const events = await EventModel.getEvents(name);
        res.json(events);
    } catch (error) {
        res.status(500).json({ error: 'Erro ao buscar eventos' });
    }
}

const getEventById = async (req, res) => {
    const { id } = req.params;
    try {
        const event = await EventModel.getEvent(id);
        if (!event) {
            return res.status(404).json({ error: 'Evento não encontrado' });
        }
        res.json(event);
    } catch (error) {
        res.status(500).json({ error: 'Erro ao buscar evento' });
    }
};

const createEvent = async (req, res) => {
    try {
        const { name_evento, localization, atracao, estilo, horario_inicio, horario_fim } = req.body;
        const event = await EventModel.createEvent(name_evento, localization, atracao, estilo, horario_inicio, horario_fim);
        res.status(201).json(event);
    } catch (error) {
        console.error(error)
        if (error.code === "23505") {
            return res.status(400).json({ message: "Essa evento já existe!"});
        }
        res.status(500).json({ message: "Erro ao criar o evento" });
    }
};

const deleteEvent = async (req, res) => {
    try {
        const event = await EventModel.deleteEvent(req.params.id);
        if (!event) {
            return res.status(404).json({ message: "Evento não foi encontrado!"});
        }
        return res.status(200).json({ message: "Evento deletado com sucesso!", event });
    } catch (error) {
        console.log(error)
        res.status(500).json({ message: "Erro ao deletar o Evento!"});
    }
};

const updateEvent = async (req, res) => {
    try {
        const { name_evento, localization } = req.body;
        const updateEvent = await EventModel.updateEvent(req.params.id, name_evento, localization);
        if (!updateEvent) {
            return res.status(404).json({ message: "Evento não encontrado!"});
        }
        res.json(updateEvent);
    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar evento!"});
    }
};



module.exports = { getAllEvents, getEventById, createEvent, deleteEvent, updateEvent }
