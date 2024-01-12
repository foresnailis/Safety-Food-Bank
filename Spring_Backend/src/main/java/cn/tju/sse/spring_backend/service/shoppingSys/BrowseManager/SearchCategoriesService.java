package cn.tju.sse.spring_backend.service.shoppingSys.BrowseManager;

import cn.tju.sse.spring_backend.dto.shoppingSys.search.SearchCategoriesResponseDTO;
import cn.tju.sse.spring_backend.dto.shoppingSys.search.mapper.CategoriesResponseMapper;
import cn.tju.sse.spring_backend.model.CommoditiesCategoriesEntity;
import cn.tju.sse.spring_backend.repository.shoppingSys.search.SearchCategoriesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description
 */
@Service
public class SearchCategoriesService {
    @Autowired
    private SearchCategoriesRepository searchCategoriesRepository;

    private final CategoriesResponseMapper categoriesResponseMapper
            = CategoriesResponseMapper.INSTANCE;

    public SearchCategoriesResponseDTO categories(){
        List<CommoditiesCategoriesEntity> categoriesEntities = searchCategoriesRepository.findAll();

        return categoriesResponseMapper.
                entitiesToResponse(categoriesEntities.toArray(new CommoditiesCategoriesEntity[0]));
    }
}
