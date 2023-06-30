package ru.practicum.dto.compilation;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Size;
import java.util.Set;

/**
 * Изменение информации о подборке событий. Если поле в запросе не указано (равно null) - значит изменение этих данных не треубется.
 */
@Getter
@Setter
public class UpdateCompilationRequest {
    private Set<Integer> events; //Список id событий подборки для полной замены текущего списка
    private boolean pinned; //Закреплена ли подборка на главной странице сайта
    @Size(min = 1, max = 50)
    private String title; //название подборки
}
