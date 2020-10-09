package study.spring.overwatch.service;

import java.util.List;

import study.spring.overwatch.model.Cart;

public interface CartService {
	public Cart getCartItem(Cart input) throws Exception;
	public List<Cart> getCartList(Cart input) throws Exception;
	public int getCartCount(Cart input) throws Exception;
 
   public int addCart(Cart input) throws Exception;
   public int editCart(Cart input) throws Exception;

   public int deleteCart(Cart input) throws Exception;
}
