package cn.tju.sse.spring_backend.dto.indentSys.CustomerIndent;

import lombok.Getter;
import lombok.Setter;


@Setter
@Getter
public class EvaluationRequestDTO {
    Integer ind_id;
    String cmt_content;
    double ind_rating;
}
