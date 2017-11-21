package com.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.Stream.dao.GameDao;
import com.Stream.dao.KindDao;
import com.Stream.dao.NoticeDao;
import com.Stream.dao.UserDao;
import com.Stream.entity.Hero;
import com.Stream.entity.Kind;
import com.Stream.entity.LolNotic;
import com.Stream.entity.NoticHero;
import com.Stream.entity.Player;
import com.Stream.entity.User;
import com.Stream.service.IPlayerService;

public class Test1 {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicatioinContext.xml");
		IPlayerService playerService= (IPlayerService) context.getBean("playService");
		List<Player> players = playerService.searchPlayerList("红叶小语");
		System.out.println(players.toString());
		/*ApplicationContext context = new ClassPathXmlApplicationContext("applicatioinContext.xml");
		UserDao uDao = (UserDao) context.getBean("userDao");
		uDao.selectList();
		System.out.println("ol");*/
		/*
		 * NoticeDao nDao=(NoticeDao) context.getBean("noticeDao"); LolNotic
		 * notic=new LolNotic(); notic.setPageYes(true); List<LolNotic>
		 * nList=nDao.selectList(notic); System.out.println(nList); for
		 * (LolNotic lolNotic : nList) {
		 * System.out.println(lolNotic.getNoticName()); }
		 */

		/*
		 * notic.setNoticId(1l); LolNotic notic2=nDao.selectById(notic);
		 * List<NoticHero> heros=notic2.getNoticHeros(); for (NoticHero
		 * noticHero : heros) { System.out.println(noticHero.getNames()); }
		 */
		/*
		 * HeroDao hDao=(HeroDao) context.getBean("heroDao"); Hero hero=new
		 * Hero(); hero.setId(1l); //Hero hero2=hDao.selectByid(hero);
		 * //List<Herospell> spellList=hero2.getHerospells(); for (Herospell
		 * herospell : spellList) { System.out.println(herospell.getName()); }
		 */

		// GameDao gDao=(GameDao) context.getBean("gameDao");

		/*
		 * Game game=new Game(); game.setId(1); Game
		 * game1=gDao.selectGameKind(game); //Kind
		 * kind=gDao.selectGameKind(kind1); System.out.println(game1.getName());
		 * List<Kind> kList=game1.getKind(); System.out.println(kList); for
		 * (Kind kind : kList) { System.out.println(kind.getKname()); }
		 */

		/*
		 * KindDao kDao=(KindDao) context.getBean("kindDao"); Kind kind=new
		 * Kind(); kind.setTotalCount(kDao.count(kind)); kind.setPageYes(true);
		 * kind.setPage(1); //kind.setPageRow(3); List<Kind>
		 * kList=kDao.selectKinds(kind);
		 */

		/*
		 * for (Kind kind2 : kList) { System.out.println(kind2.getKname()); }
		 */
		/*
		 * IcommonService service=(IcommonService)
		 * context.getBean("gameServiceImp"); KindGame kGame=new KindGame();
		 * Kind k=new Kind(); k.setKid(2); Game game=new Game(); game.setId(1);
		 * kGame.setKind(k); //kGame.setGame(game); kDao.delById(kGame);
		 * //kDao.insert(kGame); System.out.println("ok");
		 */
		// Kind kind1=kDao.selectKindGame(kind);
		/*
		 * kind.setTotalCount(kDao.count(kind)); kind.setPageYes(true);
		 * kind.setKid(3); List<Game> gameList=service.selectGames(kind); for
		 * (Game game : gameList) { System.out.println(game.getName()); }
		 */
	}
}
