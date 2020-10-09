package study.spring.overwatch.service;


import java.util.List;

import study.spring.overwatch.model.Basket;
import study.spring.overwatch.model.Cart;

public interface BasketService {
   public void insertBasket(Cart input) throws Exception;
   public List<Basket> getBasketList(int user_no) throws Exception;
   public int deleteBasket(Basket input) throws Exception;

   
   
   
   
}
