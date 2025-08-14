package repositories;

import models.Evento;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;

public class EventRepository {
    private static final List<Evento> eventos = new ArrayList<>();
    private static final AtomicInteger idCounter = new AtomicInteger(1);
    
    static {
        // Initialize with some sample events
        eventos.add(new Evento(idCounter.getAndIncrement(), "Conferencia de Tecnología", LocalDate.of(2024, 3, 15), "Centro de Convenciones"));
        eventos.add(new Evento(idCounter.getAndIncrement(), "Workshop de Java", LocalDate.of(2024, 4, 20), "Universidad Nacional"));
        eventos.add(new Evento(idCounter.getAndIncrement(), "Seminario de IA", LocalDate.of(2024, 5, 10), "Hotel Intercontinental"));
    }
    
    public List<Evento> findAll() {
        return new ArrayList<>(eventos);
    }
    
    public Optional<Evento> findById(int id) {
        return eventos.stream()
                .filter(evento -> evento.getId() == id)
                .findFirst();
    }
    
    public void save(String nombre, LocalDate fecha, String ubicacion) {
        Evento nuevoEvento = new Evento(idCounter.getAndIncrement(), nombre, fecha, ubicacion);
        eventos.add(nuevoEvento);
    }
    
    public boolean deleteById(int id) {
        return eventos.removeIf(evento -> evento.getId() == id);
    }
}
