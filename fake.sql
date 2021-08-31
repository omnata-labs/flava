create or replace function fake(locale string,expression string)
returns string
language java
imports = ('@~/automaton-1.11-8.jar',
            '@~/commons-lang3-3.5.jar',
            '@~/generex-1.0.2.jar',
            '@~/javafaker-1.0.2.jar',
            '@~/snakeyaml-1.23-android.jar')
handler='Flava.fullName'
as
$$
import com.github.javafaker.*;
import java.util.Locale;

class Flava {
    public static String fullName(String locale, String expression) {
            Faker faker;
            if (locale==null){
                faker = new Faker();
            }
            else{
                faker = new Faker(new Locale(locale));
            }
            return faker.expression(expression); 
        }
    }
$$;