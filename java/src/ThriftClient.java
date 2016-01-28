/*
 *  Copyright © Nekojarashi Inc. All Rights Reserved.
 */

import thrift.sample.*;
import org.apache.thrift.TException;
import org.apache.thrift.transport.TTransport;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TProtocol;

/**
 *
 * @author y-okubo
 */
public class ThriftClient {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // thrift-0.9.3.exe -out ThriftClient\src --gen java:fullcamel nekojarashi.thrift

        // \src>javac com\nekojarashi\*.java -cp ..\lib\*;.
        // \src>java -classpath ..\lib\*;. com.nekojarashi.ThriftClient
        ThriftServer.start();

        try {
            TTransport transport;
            transport = new TSocket("127.0.0.1", 9090);
            transport.open();

            TProtocol protocol = new TBinaryProtocol(transport);
            NekojarashiEngine.Client client = new NekojarashiEngine.Client(protocol);
            client.backupStart();
            BackupStatus status = client.backupStatus();
            System.out.println(status.getShortValue());
            System.out.println(status.getIntValue());
            System.out.println(status.getLongValue());
            System.out.println(status.getDoubleValue());
            System.out.println(status.isBoolValue());
            System.out.println(status.getStringValue());
            System.out.println(status.getListValue());
            System.out.println(status.getSetValue());
//            System.out.println(status.getMapValue());
            System.out.println(status.getMapValue().size());

            transport.close();
        } catch (TException ex) {
            ex.printStackTrace();
        }
    }

}
