package study.spring.overwatch.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import study.spring.overwatch.model.Members;

public interface MembersService {
	public Members getMembersItem(Members input) throws Exception;

	public List<Members> getMembersList(Members input) throws Exception;

	public int getMembersCount(Members input) throws Exception;

	public int addMembers(Members input) throws Exception;

	public int editEmail(Members input) throws Exception;

	public int editPassword(Members input) throws Exception;

	public int editTel(Members input) throws Exception;

	public int editAddr(Members input) throws Exception;

	public int deleteMembers(Members input) throws Exception;

	public Members getMembersInfo(Members input) throws Exception;

	public Members getMembersselect(int user_no) throws Exception;

	public Members getMembersFindId(Members input) throws Exception;

	public Members getMembersFindPw(Members input) throws Exception;

	public void logout(HttpServletResponse response) throws Exception;

}
