package com.gs;

import com.gs.bean.Bz;
import com.gs.service.BzService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by ：余鹏
 * time：2018/1/3.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/config/spring-*.xml"})
public class BzTest {

    @Resource
    private BzService bzService;

    @Test
    public void Bzsavetest(){
        Bz bz=new Bz();
        bz.setBzname("多金宝1");
        bz.setState(0);
        bzService.save(bz);
    }

    @Test
    public void BzupdateStatetest(){
        Bz bz=new Bz();
        bz.setBzid(5L);
        bz.setBzname("多金宝2");
        bz.setState(1);
        bzService.updateState(bz);
    }

    @Test
    public void BzremoveByIdtest(){
        bzService.removeById(5L);
    }

}
