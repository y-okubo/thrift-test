/*
 *  Copyright © Nekojarashi Inc. All Rights Reserved.
 */

import thrift.sample.*;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;

/**
 *
 * @author y-okubo
 */
public class Handler implements AwesomeService.Iface {

    private final Types types;

    public Handler() {
        types = new Types();
        types.setShortValue(new Integer(1).shortValue());
        types.setIntValue(1);
        types.setLongValue(new Long(1));
        types.setDoubleValue(new Double(1));
        types.setBoolValue(true);
        types.setStringValue("A");
        types.setListValue(Arrays.asList("A"));
        types.setSetValue(new HashSet<>(Arrays.asList("A")));
        types.setMapValue(new HashMap<String, Integer>() {
            {
                for (int i = 0; i < 50000; i++) {
                    put(Integer.toString(i), i);
                }
            }
        });
    }

    @Override
    public void sayHello() throws org.apache.thrift.TException {
        System.out.println("Hello!");
    }

    @Override
    public Types listingTypes() throws org.apache.thrift.TException {
        return types;
    }
}
