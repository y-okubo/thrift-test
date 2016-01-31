/*
 *  Copyright © Nekojarashi Inc. All Rights Reserved.
 */

import thrift.sample.*;
import org.apache.thrift.TException;
import org.apache.thrift.transport.TTransport;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.protocol.TProtocol;
import java.text.*;
import org.apache.thrift.protocol.TJSONProtocol;

/**
 *
 * @author y-okubo
 */
public class Client {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // thrift-0.9.3.exe -out ThriftClient\src --gen java:fullcamel nekojarashi.thrift

        // \src>javac com\nekojarashi\*.java -cp ..\lib\*;.
        // \src>java -classpath ..\lib\*;. com.nekojarashi.ThriftClient
        try {
            TTransport transport;
            transport = new TSocket("127.0.0.1", 9090);
            transport.open();

            TProtocol protocol = new TJSONProtocol(transport);
            AwesomeService.Client client = new AwesomeService.Client(protocol);
            client.sayHello();

            DateFormat df = new SimpleDateFormat("yyyy-MM-dd (EE) HH:mm:ss.SSS zz");

            long a = 0;
            for (int i = 0; i < 10; i++) {
                long s = System.currentTimeMillis();
                Types status = client.listingTypes();
                long e = System.currentTimeMillis();
                System.out.println((e - s) + "ms");
                a = a + (e - s);
            }
            System.out.println("Average: " + (a / 10));

            transport.close();
        } catch (TException ex) {
            ex.printStackTrace();
        }
    }

}
