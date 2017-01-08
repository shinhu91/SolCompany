package mysite.com.app;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class BbsController {
	
	@Autowired
	BoardService boardService;
	
    @RequestMapping(value = "/writed.do")
    public String show_write_form(Model model){    	
    	
    	return "write";
    }
    
    @RequestMapping(value = "/newfile.do")
    public String show_write_form2(Model model){    	
    	
    	return "NewFile";
    }
    
    @RequestMapping(value = "/buy.do")
    public String show_write_form(BoardBean bean, HttpServletRequest request ,Model model){    	
        	
    	System.out.println("아아아 : " + bean.getRank());
    	
    	if(bean.getCount().equals("one")){
    		bean.setCount("1");
    	}else if(bean.getCount().equals("two")){
    		bean.setCount("2");
    	}else if(bean.getCount().equals("three")){
    		bean.setCount("3");
    	}
    	
    	if(bean.getBuy().equals("책상")){
    		
    		int count = Integer.parseInt(bean.getCount());    		
    		bean.setMoney(10000*count);
    		
    	}else if(bean.getBuy().equals("의자")){
    		int count = Integer.parseInt(bean.getCount());    		
    		bean.setMoney(5000*count);
    	}    	
    	
    	boardService.insertBoard(bean);
    	
    	return "buyok";
    }
    
    @RequestMapping(value = "/list.do")
    public String list(BoardBean bean, HttpServletRequest request ,Model model){    	
        	
    	List result = boardService.Selectlist();
    	model.addAttribute("result", result);    
    	
    	return "list";
    }
    
    @RequestMapping(value = "/read.do")
    public String read(Model model, @RequestParam("idx") String idx){    	
        
       	List<BoardBean> result = boardService.Selectread(idx);
    	    	
    	model.addAttribute("idx", idx);
    	model.addAttribute("writer", result.get(0).getWriter());  
    	model.addAttribute("rank", result.get(0).getRank()); 
    	model.addAttribute("buy", result.get(0).getBuy()); 
    	model.addAttribute("count", result.get(0).getCount()); 
    	model.addAttribute("reason", result.get(0).getReason()); 
    	
    	return "read";
    }
    
    @RequestMapping(value = "/confirm.do")
    public String confirm(BoardBean bean, Model model, @RequestParam("idx") String idx){    	
            	
    	List<BoardBean> result = boardService.Selectread(idx);
    	
    	MoneyBean moneybean = new MoneyBean();
    	
    	List<MoneyBean> moneyresult1 = boardService.Selectmoney();
    	    	
    	moneybean.setAsset(moneyresult1.get(0).getAsset()-result.get(0).getMoney());
    	moneybean.setBorrow(moneyresult1.get(0).getBorrow());
    	moneybean.setMoney(moneyresult1.get(0).getAsset()-result.get(0).getMoney()-moneyresult1.get(0).getBorrow());
    	
    	int insertmoney = boardService.updatemoney(moneybean);
    	    	
    	if(result.get(0).getReason().equals("신규주문")){    	
    	bean.setCount(result.get(0).getCount());    	
    	}else{
    		bean.setCount("0");
    	}
    	
    	if(result.get(0).getBuy().equals("책상")){
    	bean.setBuy("desk");    	
    	boardService.insertBuy(bean);
    	}else if(result.get(0).getBuy().equals("의자")){
        bean.setBuy("chair");     
        boardService.insertBuy2(bean);
    	}
    	
    	int deletemoney = boardService.Deleteorder(idx);
    	
    	return "confirmok";
    }
    
	
}
