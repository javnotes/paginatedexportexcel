package ltd.newbee.mall.service;

import ltd.newbee.mall.entity.User;
import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.PageResult;

import java.util.List;

public interface UserService {

    public PageResult getUserPage(PageQueryUtil pageUtil);

    public List<User> getUserAll();
}
