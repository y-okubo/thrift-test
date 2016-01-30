/*
 *  Copyright © Nekojarashi Inc. All Rights Reserved.
 */

import org.apache.thrift.TException;
import thrift.sample.*;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

/**
 *
 * @author y-okubo
 */
public class Handler implements AwesomeService.Iface {

    private final HashMap<String, Integer> map;

    public Handler() {
        map = new HashMap<String, Integer>() {
            {
                for (int i = 0; i < 50000; i++) {
                    put(Integer.toString(i), i);
                }
//                put("first", 1);
//                put("second", 2);
//                put("third", 3);
            }
        };
    }

    @Override
    public void sayHello() throws org.apache.thrift.TException {
        System.out.println("Hello!");
    }

    @Override
    public Types listingTypes() throws org.apache.thrift.TException {
        Types status = new Types();
        status.setShortValue(new Integer(10).shortValue());
        status.setIntValue(new Integer(10).shortValue());
        status.setLongValue(new Integer(10).shortValue());
        status.setDoubleValue(new Integer(10).shortValue());
        status.setBoolValue(true);
        status.setStringValue("ZZ");
        status.setListValue(Arrays.asList("AA", "BB", "CC"));
        status.setSetValue(new HashSet<>(Arrays.asList("a", "b", "c")));
//        status.setMapValue(new HashMap<String, Integer>() {
//            {
//                put("first", 1);
//                put("second", 2);
//                put("third", 3);
//            }
//        });
        status.setMapValue(map);

        return status;
    }
}
