/*
 * Created on 29 thg 9 2017 ( Time 12:01:29 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.dream_reader.business.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.springframework.data.jpa.domain.Specification;

import org.dream_reader.bean.Contents;
import org.dream_reader.bean.jpa.ContentsEntity;
import org.dream_reader.business.service.ContentsService;
import org.dream_reader.business.service.mapping.ContentsServiceMapper;
import org.dream_reader.data.repository.jpa.ContentsJpaRepository;
import org.dream_reader.web.common.utils.DataUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
/**
 * Implementation of ContentsService
 */
@Component
@Transactional
public class ContentsServiceImpl implements ContentsService {

	@Resource
	private ContentsJpaRepository contentsJpaRepository;

	private static final Integer PAGE_SIZE   = 15;

	@Resource
	private ContentsServiceMapper contentsServiceMapper;
	
	@Override
	public Contents findById(Integer id) {
		ContentsEntity contentsEntity = contentsJpaRepository.findOne(id);
		return contentsServiceMapper.mapContentsEntityToContents(contentsEntity);
	}

	@Override
	public ContentsEntity findOne(Integer id) {
		ContentsEntity contentsEntity = contentsJpaRepository.findOne(id);
		return contentsEntity;
	}

	@Override
	public Page<ContentsEntity> findAll(Integer pageNumber) {

		PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE,
				new Sort(new Order(Direction.DESC, "id")));
		return contentsJpaRepository.findAll(request);
	}

	@Override
	public List<Contents> findAll() {
		Iterable<ContentsEntity> entities = contentsJpaRepository.findAll();
		List<Contents> beans = new ArrayList<Contents>();
		for(ContentsEntity contentsEntity : entities) {
			beans.add(contentsServiceMapper.mapContentsEntityToContents(contentsEntity));
		}
		return beans;
	}

	/**
	 * Count total entit
	 * @return Long
	 */
	public Long countTotal(){
		Long count = contentsJpaRepository.count();
		return count;
	}

	@Override
	public Contents save(Contents contents) {
		return update(contents) ;
	}

	@Override
	public Contents create(Contents contents) {
/*
		ContentsEntity contentsEntity = contentsJpaRepository.findOne(contents.getId());
		if( contentsEntity != null ) {
			throw new IllegalStateException("already.exists");
		}

		contentsEntity = new ContentsEntity();
		contentsServiceMapper.mapContentsToContentsEntity(contents, contentsEntity);
		ContentsEntity contentsEntitySaved = contentsJpaRepository.save(contentsEntity);
		return contentsServiceMapper.mapContentsEntityToContents(contentsEntitySaved);
*/
		ContentsEntity contentsEntity = new ContentsEntity();
		contentsServiceMapper.mapContentsToContentsEntity(contents, contentsEntity);
		ContentsEntity contentsEntitySaved = contentsJpaRepository.save(contentsEntity);
		return contentsServiceMapper.mapContentsEntityToContents(contentsEntitySaved);
	}

	@Override
	public Contents update(Contents contents) {
		ContentsEntity contentsEntity = contentsJpaRepository.findOne(contents.getId());
		contentsServiceMapper.mapContentsToContentsEntity(contents, contentsEntity);
		ContentsEntity contentsEntitySaved = contentsJpaRepository.save(contentsEntity);
		return contentsServiceMapper.mapContentsEntityToContents(contentsEntitySaved);
	}

	@Override
	public void delete(Integer id) {
		contentsJpaRepository.delete(id);
	}

	public ContentsJpaRepository getContentsJpaRepository() {
		return contentsJpaRepository;
	}

	public void setContentsJpaRepository(ContentsJpaRepository contentsJpaRepository) {
		this.contentsJpaRepository = contentsJpaRepository;
	}

	public ContentsServiceMapper getContentsServiceMapper() {
		return contentsServiceMapper;
	}

	public void setContentsServiceMapper(ContentsServiceMapper contentsServiceMapper) {
		this.contentsServiceMapper = contentsServiceMapper;
	}

	@Override
	public Page<ContentsEntity> listPaging(Integer page, Integer size) {
		try {
			PageRequest pageable = new PageRequest(page-1, size, new Sort(new Order(Direction.DESC, "createDate")));
			return contentsJpaRepository.listPaging(pageable);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Page<ContentsEntity> filterAdmin( Map<String, Object> params, Integer page, Integer size) {

		Specification<ContentsEntity> spec = new Specification<ContentsEntity>() {
			@Override
			public Predicate toPredicate(Root<ContentsEntity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicates = new ArrayList<>();

				if (params.get("key") != null) {
				String key = String.valueOf(params.get("key"));
					if (params.get("type") != null) {
						String type = String.valueOf(params.get("type"));
						Predicate predicate = cb.equal(root.get(type), "%"+key+"%");
						predicates.add(predicate);
					}
				}

				return cb.and(predicates.toArray(new Predicate[] {}));
			}

		};

		Order order = new Order(Direction.DESC, "createDate");
		if (params.get("orderBy") != null) {
			String orderBy = String.valueOf(params.get("orderBy"));
			order = new Order(Direction.DESC, orderBy);
		}

		PageRequest pageable = new PageRequest(page - 1, size, new Sort(order));
		return contentsJpaRepository.findAll(spec, pageable);
	}

	@Override
	public List<ContentsEntity> findByCategoryId(Integer categoryId) {
		try {
			return contentsJpaRepository.findByCategoryId(categoryId);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
