package dxol.service.school;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import dxol.entity.School;
import dxol.repository.SchoolDao;

@Component
@Transactional
public class SchoolService {
	private SchoolDao schoolDao;

	@Autowired
	public void setSchoolDao(SchoolDao schoolDao) {
		this.schoolDao = schoolDao;
	}

	public List<School> findAllSchool() {
		return (List<School>) schoolDao.findAll();
	}

	public School findByName(String name) {
		return schoolDao.findByName(name);
	}

}
