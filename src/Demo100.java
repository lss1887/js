import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Demo100 {
    public static void main(String[] args) {

        String a = "2022-03-43";
        System.out.println(a.replaceAll("-", ""));

        System.out.println(Integer.valueOf(new SimpleDateFormat("yyyyMMdd").format(new Date())) == 20200416);
    }
}
