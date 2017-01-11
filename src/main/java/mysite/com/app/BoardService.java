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
	
public List Listselectpage(BoardBean bean){
		
		return sqlSession.selectList("Listselectpage", bean);
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
   
   
   public int Deleteorder(String idx){
		
		return sqlSession.delete("Deleteorder", idx);
	    }
	
   public List Selectmoney(){
		
		return sqlSession.selectList("Selectmoney");
	}  
   
   public int updatemoney(MoneyBean bean){
		
		return sqlSession.insert("updatemoney", bean);
	}   
   
   public List Selectmoneyall(){
		
		return sqlSession.selectList("Selectmoneyall");
	}
   
   public List Selectbuyall(){
		
		return sqlSession.selectList("Selectbuyall");
	}
     
   public List memberselect(MemberBean bean){
		
		return sqlSession.selectList("memberselect",bean);
	}
   
   public List totalpay(){
		
		return sqlSession.selectList("totalpay");
	}
   
}
