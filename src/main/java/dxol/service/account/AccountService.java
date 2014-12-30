/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package dxol.service.account;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.security.utils.Digests;
import org.springside.modules.utils.Clock;
import org.springside.modules.utils.Encodes;

import dxol.entity.Admin;
import dxol.entity.Student;
import dxol.entity.User;
import dxol.repository.AdminDao;
import dxol.repository.StudentDao;

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

	private static Logger logger = LoggerFactory
			.getLogger(AccountService.class);

	private Clock clock = Clock.DEFAULT;
	private AdminDao adminDao;
	private StudentDao studentDao;

	public void updateUser(User user, String method) {
		if (StringUtils.isNotBlank(user.getPlainPassword())) {
			entryptPassword(user);
		}
		if (method.equals(ADMIN_METHOD)) {
			adminDao.save((Admin) user);
		} else if (method.equals(STUDENT_METHOD)) {
			studentDao.save((Student) user);
		}
	}

	/**
	 * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
	 */
	private void entryptPassword(User user) {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		user.setSalt(Encodes.encodeHex(salt));

		byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(),
				salt, HASH_INTERATIONS);
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
			Admin admin = adminDao.findByUsername(username);
			System.out.println("admin------------- " + admin.getName());
			return admin;
		} else if (method.equals(STUDENT_METHOD)) {
			return studentDao.findByUsername(username);
		} else {
			return null;
		}
	}

	public Admin getAdmin(Long id) {
		return adminDao.findOne(id);
	}

	public void updateAdmin(User user) {
		updateUser(user, ADMIN_METHOD);
	}

	public void updateStudent(Student student) {

		updateUser(student, STUDENT_METHOD);
	}
}
