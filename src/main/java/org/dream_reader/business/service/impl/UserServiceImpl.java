/*
 * Created on 28 thg 9 2017 ( Time 13:53:58 )
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

import org.dream_reader.bean.User;
import org.dream_reader.bean.jpa.UserEntity;
import java.util.Date;
import org.dream_reader.business.service.UserService;
import org.dream_reader.business.service.mapping.UserServiceMapper;
import org.dream_reader.data.repository.jpa.UserJpaRepository;
import org.dream_reader.web.common.utils.DataUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
/**
 * Implementation of UserService
 */
@Component
@Transactional
public class UserServiceImpl implements UserService {

	@Resource
	private UserJpaRepository userJpaRepository;

	private static final Integer PAGE_SIZE   = 15;

	@Resource
	private UserServiceMapper userServiceMapper;
	
	@Override
	public User findById(Integer id) {
		UserEntity userEntity = userJpaRepository.findOne(id);
		return userServiceMapper.mapUserEntityToUser(userEntity);
	}

	@Override
	public UserEntity findOne(Integer id) {
		UserEntity userEntity = userJpaRepository.findOne(id);
		return userEntity;
	}

	@Override
	public Page<UserEntity> findAll(Integer pageNumber) {

		PageRequest request = new PageRequest(pageNumber - 1, PAGE_SIZE,
				new Sort(new Order(Direction.DESC, "id")));
		return userJpaRepository.findAll(request);
	}

	@Override
	public List<User> findAll() {
		Iterable<UserEntity> entities = userJpaRepository.findAll();
		List<User> beans = new ArrayList<User>();
		for(UserEntity userEntity : entities) {
			beans.add(userServiceMapper.mapUserEntityToUser(userEntity));
		}
		return beans;
	}

	/**
	 * Count total entit
	 * @return Long
	 */
	public Long countTotal(){
		Long count = userJpaRepository.count();
		return count;
	}

	@Override
	public User save(User user) {
		return update(user) ;
	}

	@Override
	public User create(User user) {
/*
		UserEntity userEntity = userJpaRepository.findOne(user.getId());
		if( userEntity != null ) {
			throw new IllegalStateException("already.exists");
		}

		userEntity = new UserEntity();
		userServiceMapper.mapUserToUserEntity(user, userEntity);
		UserEntity userEntitySaved = userJpaRepository.save(userEntity);
		return userServiceMapper.mapUserEntityToUser(userEntitySaved);
*/
		UserEntity userEntity = new UserEntity();
		userServiceMapper.mapUserToUserEntity(user, userEntity);
		UserEntity userEntitySaved = userJpaRepository.save(userEntity);
		return userServiceMapper.mapUserEntityToUser(userEntitySaved);
	}

	@Override
	public User update(User user) {
		UserEntity userEntity = userJpaRepository.findOne(user.getId());
		userServiceMapper.mapUserToUserEntity(user, userEntity);
		UserEntity userEntitySaved = userJpaRepository.save(userEntity);
		return userServiceMapper.mapUserEntityToUser(userEntitySaved);
	}

	@Override
	public void delete(Integer id) {
		userJpaRepository.delete(id);
	}

	@Override
	public Page<UserEntity> listPaging(Integer page, Integer size) {
		try {
			PageRequest pageable = new PageRequest(page-1, size, new Sort(new Order(Direction.DESC, "createDate")));
			return userJpaRepository.listPaging(pageable);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	

	@Override
	public UserEntity findByUsername(String username) {
		try {
			return userJpaRepository.findByUsername(username);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public User login(String username, String password) {
		try {
			UserEntity u = userJpaRepository.login(username, password);
			return userServiceMapper.mapUserEntityToUser(u);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Page<UserEntity> filterAdmin( Map<String, Object> params, Integer page, Integer size) {

		Specification<UserEntity> spec = new Specification<UserEntity>() {
			@Override
			public Predicate toPredicate(Root<UserEntity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicates = new ArrayList<>();

				if (params.get("key") != null) {
				String key = String.valueOf(params.get("key"));
					if (params.get("type") != null) {
						String type = String.valueOf(params.get("type"));
						Predicate predicate = cb.equal(root.get(type), "%"+key+"%");
						predicates.add(predicate);
					}
				}

				if(params.get("startTime") != null){
					String startTime = String.valueOf(params.get("startTime"));
					Predicate predicate = cb.equal(root.<Date>get("createDate"),DataUtils.parseDate(startTime, DataUtils.FormatDate.YYYYMMDD.getPattern()));
					predicates.add(predicate);
				}
				
				if(params.get("endTime") != null){
					String endTime = String.valueOf(params.get("endTime"));
					Predicate predicate = cb.equal(root.<Date>get("createDate"),DataUtils.parseDate(endTime, DataUtils.FormatDate.YYYYMMDD.getPattern()));
					predicates.add(predicate);
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
		return userJpaRepository.findAll(spec, pageable);
	}

}
