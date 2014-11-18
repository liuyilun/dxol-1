package dxol.service.identity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import dxol.entity.Identity;
import dxol.repository.IdentityDao;


@Component
@Transactional

public class IdentityService {
	private IdentityDao identityDao;
	@Autowired
	public void setIdentityDao(IdentityDao identityDao){
		this.identityDao=identityDao;
	}
	public List<Identity> findAllIdentity(){
		return (List<Identity>)identityDao.findAll();
	}
 }
