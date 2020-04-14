package app.bean;

import org.junit.Test;

import static org.junit.Assert.*;

public class UserBeanTest {

    @Test
    public void getFirstName() throws Exception{
        UserBean user = new UserBean(1,"mail@mail.com","qwe123","Oleg","Ivanov");
        assertEquals(false,user.isValid());
    }
}