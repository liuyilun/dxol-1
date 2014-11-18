package dxol.service.summary;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import dxol.entity.Summary;
import dxol.repository.SummaryDao;


@Component
@Transactional
public class SummaryService {
	private SummaryDao summaryDao;

	@Autowired
	public void setSummaryDao(SummaryDao summaryDao) {
		this.summaryDao = summaryDao;
	}
	public void deletesummary(Long id){
		summaryDao.delete(id);
	}
	public void savesummary(Summary summary){
		summaryDao.save(summary);
	}
 }
