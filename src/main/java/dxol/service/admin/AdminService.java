package dxol.service.admin;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.security.utils.Digests;
import org.springside.modules.utils.Clock;
import org.springside.modules.utils.Encodes;

import dxol.entity.Admin;
import dxol.entity.User;
import dxol.repository.AdminDao;


@Component
@Transactional
public class AdminService {
	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	private static final int SALT_SIZE = 8;
	private Clock clock = Clock.DEFAULT;
	private AdminDao adminDao;
	@Autowired
	
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	public Admin findAdminbyName(Long id){
		return adminDao.findOne(id);
	}
	public List<Admin> findAllAdmin(){
		return (List<Admin>)adminDao.findAll(new Sort(Direction.ASC, "id"));
	}
	@Transactional(readOnly=false)
	public void deleteAdmin(Long id){
		adminDao.delete(id);
	}
	@Transactional(readOnly=false)
	public void saveAdmin(Admin admin){
		if (StringUtils.isNotBlank(admin.getPlainPassword())) {
			entryptPassword(admin);
		}
		admin.setRegisterDate(clock.getCurrentDate());
		adminDao.save(admin);
	}
	public void updateAdmin(Admin admin){
		if (StringUtils.isNotBlank(admin.getPlainPassword())) {
			entryptPassword(admin);
		}
		adminDao.save(admin);
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
	
}
