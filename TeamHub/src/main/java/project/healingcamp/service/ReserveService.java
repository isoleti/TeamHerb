package project.healingcamp.service;

import java.util.HashMap;
import java.util.List;

import project.healingcamp.vo.ReserveVO;
import project.healingcamp.vo.UserVo;

public interface ReserveService {
	
	//������� ����
	int resF(ReserveVO vo);
	//���ݰ���
	int couF(ReserveVO vo);
	//����PK ��ȸ
	ReserveVO cnoidx(ReserveVO vo);
	//�������� List ��ȸ
	List <ReserveVO> centerlist(ReserveVO vo);
	//���� PK ��ȸ
	ReserveVO conidx(ReserveVO vo);
	//�������� PK ��ȸ
	ReserveVO cintidx(ReserveVO vo);
	
}
