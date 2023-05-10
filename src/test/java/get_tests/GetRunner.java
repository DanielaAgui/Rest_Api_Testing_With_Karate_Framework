package get_tests;

import com.intuit.karate.junit5.Karate;

public class GetRunner {

    @Karate.Test
    public Karate testRunner() {
        return Karate.run("classpath:get_tests/get_products.feature");
    }
}
