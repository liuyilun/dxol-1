/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package dxol.service.account;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.security.utils.Digests;
import org.springside.modules.utils.Clock;
import org.springside.modules.utils.Encodes;

import dxol.entity.User;
import dxol.repository.AdminDao;
import dxol.repository.StudentDao;
import dxol.service.account.ShiroDbRealm.ShiroUser;

/**
 * 用户管理类.
 * 
 * @author calvin
 */
// Spring Service Bean的标识.
@Component
@Transactional
public class AccountService {

	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	private static final int SALT_SIZE = 8;

	public final String STUDENT_METHOD = "student";
	public final String ADMIN_METHOD = "admin";

	private static Logger logger = LoggerFactory.getLogger(AccountService.class);

	private Clock clock = Clock.DEFAULT;
	private AdminDao adminDao;
	private StudentDao studentDao;

	// public List<User> getAllUser() {
	// return (List<User>) userDao.findAll();
	// }
	//
	// public User getUser(Long id) {
	// return userDao.findOne(id);
	// }
	//
	// public User findUserByLoginName(String loginName) {
	// return userDao.findByLoginName(loginName);
	// }
	//
	// public void registerUser(User user) {
	// entryptPassword(user);
	// user.setRole("user");
	// user.setRegisterDate(clock.getCurrentDate());
	//
	// userDao.save(user);
	// }
	//
	// public void updateUser(User user) {
	// if (StringUtils.isNotBlank(user.getPlainPassword())) {
	// entryptPassword(user);
	// }
	// userDao.save(user);
	// }
	//
	// public void deleteUser(Long id) {
	// if (isSupervisor(id)) {
	// logger.warn("操作员{}尝试删除超级管理员用户", getCurrentUserName());
	// throw new ServiceException("不能删除超级管理员用户");
	// }
	// userDao.delete(id);
	// taskDao.deleteByUserId(id);
	//
	// }

	/**
	 * 判断是否超级管理员.
	 */
	private boolean isSupervisor(Long id) {
		return id == 1;
	}

	/**
	 * 取出Shiro中的当前用户LoginName.
	 */
	private String getCurrentUserName() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user.username;
	}

	/**
	 * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
	 */
	private void entryptPassword(User user) {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		user.setSalt(Encodes.encodeHex(salt));

		byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(), salt, HASH_INTERATIONS);
		user.setPassword(Encodes.encodeHex(hashPassword));
	}

	@Autowired
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	@Autowired
	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	public void setClock(Clock clock) {
		this.clock = clock;
	}

	public User findUserByLoginNameAndMethod(String username, String method) {
		if (method.equals(ADMIN_METHOD)) {
			return adminDao.findByUsername(username);
		} else if (method.equals(STUDENT_METHOD)) {
			return studentDao.findByUsername(username);
		} else {
			return null;
		}
	}
}
