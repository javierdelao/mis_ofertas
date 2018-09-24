import com.mis_ofertas.app.model.User;
import com.mis_ofertas.app.response.LoginResponse;
import com.mis_ofertas.app.service.RestService;
import org.apache.commons.lang3.RandomStringUtils;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class UnitTest {

    private RestService restService;


    @Autowired
    public void setRestService(RestService restService) {
        this.restService = restService;
    }


    @Before
    public void setUp() throws Exception {
        restService = new RestService(
        );
    }


    @Test
    public void loginInvalid() throws Exception {
        User usuario = new User();
        usuario.setPassword("123");
        usuario.setRut("123456-7");
        usuario.setId(Long.parseLong(RandomStringUtils.randomNumeric(8)));

        LoginResponse loginResponse = restService.login(usuario);
        if (!loginResponse.getStatus().equals("invalid")) {
            throw new Exception();
        }
        System.out.println("clave incorrecta");
    }


}
