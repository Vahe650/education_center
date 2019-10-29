package am.nelea.educenter.security;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;


public class CurrentUser extends User {

    private am.nelea.educenter.model.User user;

    public CurrentUser(am.nelea.educenter.model.User user) {
        super(user.getEmail(), user.getPassword(), user.isVerify(), true, true,
                true, AuthorityUtils.createAuthorityList(user.getType().name()));
        this.user = user;
    }

    public am.nelea.educenter.model.User getUser() {
        return user;
    }

    public int getId() {
        return user.getId();
    }
}
