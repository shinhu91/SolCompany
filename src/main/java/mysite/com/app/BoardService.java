package mysite.com.app;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;



@Repository
public class BoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertBoard(BoardBean bean){
		
		return sqlSession.insert("insertBoard", bean);
	}
	
	public List Selectlist(){
		
		return sqlSession.selectList("Listselect");
	}
	
    public List Selectread(String idx){
		
		return sqlSession.selectList("readselect",idx);
	}
    
    public int insertBuy(BoardBean bean){
		
		return sqlSession.insert("insertBuy", bean);
	}
    public int insertBuy2(BoardBean bean){
		
		return sqlSession.insert("insertBuy2", bean);
	}

   public int inserttest(BoardBean bean){
	
	return sqlSession.insert("inserttest", bean);
    }

	
	
	

	
}
