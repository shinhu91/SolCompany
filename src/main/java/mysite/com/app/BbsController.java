package mysite.com.app;


import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
        
    	if(bean.getState().equals("구입")){
    	if(bean.getCount().equals("one")){
    		bean.setCount("1");
    	}else if(bean.getCount().equals("two")){
    		bean.setCount("2");
    	}else if(bean.getCount().equals("three")){
    		bean.setCount("3");
    	}
    	}
    	
    	if(bean.getState().equals("판매")){
        	if(bean.getCount().equals("one")){
        		bean.setCount("-1");
        	}else if(bean.getCount().equals("two")){
        		bean.setCount("-2");
        	}else if(bean.getCount().equals("three")){
        		bean.setCount("-3");
        	}
        	}
    	
    	if(bean.getState().equals("구입")){
    	if(bean.getBuy().equals("책상")){
    		
    		int count = Integer.parseInt(bean.getCount());    		
    		bean.setMoney(10000*count);
    		
    	}else if(bean.getBuy().equals("의자")){
    		int count = Integer.parseInt(bean.getCount());    		
    		bean.setMoney(5000*count);
    	}    	
    	}
    	
    	if(bean.getState().equals("판매")){
        	if(bean.getBuy().equals("책상")){
        		
        		int count = Integer.parseInt(bean.getCount());    		
        		bean.setMoney(15000*count);
        		
        	}else if(bean.getBuy().equals("의자")){
        		int count = Integer.parseInt(bean.getCount());    		
        		bean.setMoney(10000*count);
        	}    	
        	}
    	
    	boardService.insertBoard(bean);
    	
    	return "buyok";
    }
    
    @RequestMapping(value = "/list.do")
    public String list(BoardBean bean, HttpServletRequest request ,Model model){    	
        	
    	 String idx = request.getParameter("idx");
    	 
    	if(idx != null){
    	  	List<BoardBean> result = boardService.Selectread(idx);
	    	
        	model.addAttribute("idx", idx);
        	model.addAttribute("writer", result.get(0).getWriter());  
        	model.addAttribute("rank", result.get(0).getRank()); 
        	model.addAttribute("buy", result.get(0).getBuy()); 
        	model.addAttribute("count1", result.get(0).getCount()); 
        	model.addAttribute("reason", result.get(0).getReason()); 
    	}
    	
    	
    	
    	 String pageNum = request.getParameter("pageNum");
         
			if (pageNum == null) {
				pageNum = "1";
			}
		
			int pageSize = 5;
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = currentPage * pageSize;
			int count = 0;
			
			
			bean.setStart(startRow-1);			
					
			List result2 = boardService.Listselectpage(bean);
			
			
	    	model.addAttribute("result", result2);    
	    	
	    	List result = boardService.Selectlist();
	    	int replesize = result.size();  
			
			count = replesize;
							
			request.setAttribute("count", new Integer(count));
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); 
			int startPage = 0;
			int a = (currentPage / pageSize) * pageSize - pageSize + 1;
			int b = (currentPage / pageSize) * pageSize + 1;
			if(currentPage % pageSize == 0){startPage = a;}else{startPage = b;}
			int endPage = startPage + pageSize - 1; 
			request.setAttribute("pageCount", new Integer(pageCount));
			request.setAttribute("startPage", new Integer(startPage));
			request.setAttribute("endPage", new Integer(endPage));
                      
          request.setAttribute("replesize", replesize);  
    	
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
    	
    	if(result.get(0).getState().equals("구입")){
    	    	
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
    	}
    	
    	
    	if(result.get(0).getState().equals("판매")){
	    	
        	moneybean.setAsset(moneyresult1.get(0).getAsset()+result.get(0).getMoney());
        	moneybean.setBorrow(moneyresult1.get(0).getBorrow());
        	moneybean.setMoney(moneyresult1.get(0).getAsset()+result.get(0).getMoney()-moneyresult1.get(0).getBorrow());
        	
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
        	}
    	    	  	
    	int deletemoney = boardService.Deleteorder(idx);
    	
    	return "confirmok";
    }
    
    @RequestMapping(value = "/confirmdelete.do")
    public String confirmdelete(Model model, @RequestParam("idx") String idx){    	
        
    	List<BoardBean> result = boardService.Selectread(idx);
    	int deletemoney = boardService.Deleteorder(idx);
    	
    	return "confirmok";
    }
    
    @RequestMapping(value = "/finance.do")
    public String confirmdelete(Model model){    	
            	
    	List<MoneyBean> resultmoney = boardService.Selectmoneyall();
    	List<BuyBean> resultbuy = boardService.Selectbuyall();
    	
    	model.addAttribute("resultmoney", resultmoney);
    	model.addAttribute("resultbuy", resultbuy);
    	
    	resultmoney.get(0).getMoney();
    	
    	int money = resultmoney.get(0).getMoney();
    	int desk = Integer.parseInt(resultbuy.get(0).getDesk()) ;
    	int chair = Integer.parseInt(resultbuy.get(0).getChair());
    	
    	model.addAttribute("money", money);
    	model.addAttribute("goods", desk*10000 + chair*5000);
    	model.addAttribute("totalmoney", (desk*10000 + chair*5000)+money);
    	
    	return "finance";
    }
    
    @RequestMapping(value = "/totalpay.do")
    public String totalpay(Model model){    
    	            	
    	List<MemberBean> result = boardService.totalpay();
    	   int sum=0;
    	   int sum2=0;
    	  
    	  for(int i=0; i<result.size(); i++){
          	
          	int years = result.get(i).getYears();
          	int rank=0; 	
          	if(result.get(0).getRank().equals("부장")){
          		rank = 500000;
          	}
          	if(result.get(0).getRank().equals("과장")){
          		rank = 300000;
          	}
          	if(result.get(0).getRank().equals("사원")){
          		rank = 100000;
          	}      	
          	
//          	for(int k=0; k<result.size(); k++){
            	
            	sum = sum + rank;
            	sum2 = sum2 + years;
            	 
//             }

          	
          }
    	  model.addAttribute("sum", sum);
        	model.addAttribute("sum2", sum2);
    	  model.addAttribute("basic", result.size());
    	model.addAttribute("result", result);
    	
      
    	
        
    	
    	return "totalpay";
    	
    }
    
    
    @RequestMapping(value = "/pay.do")
    public String pay(Model model,HttpServletRequest request){    	
        
//    	HttpSession session=request.getSession();
//    	String writername = (String)session.getAttribute("memid");
    	
    	MemberBean member = new MemberBean();    	
    	member.setName("이경남");
    	
    	List<MemberBean> result = boardService.memberselect(member);
    	
    	
    	if(result.get(0).getRank().equals("부장")){
    		model.addAttribute("rank", 500000);
    	}
    	if(result.get(0).getRank().equals("과장")){
    		model.addAttribute("rank", 300000);
    	}
    	if(result.get(0).getRank().equals("사원")){
    		model.addAttribute("rank", 100000);
    	}
    	
    	
    	model.addAttribute("years", result.get(0).getYears());    	

    	model.addAttribute("result", result);
    	
    	return "pay";
    }
	
}
