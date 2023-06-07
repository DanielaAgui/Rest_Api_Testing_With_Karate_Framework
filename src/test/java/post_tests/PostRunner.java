package post_tests;

import com.intuit.karate.junit5.Karate;

public class PostRunner {

    @Karate.Test
    public Karate testRunner() {
        return Karate.run("classpath:post_tests/post_products.feature");
    }
}
