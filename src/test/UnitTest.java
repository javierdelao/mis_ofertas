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





}
