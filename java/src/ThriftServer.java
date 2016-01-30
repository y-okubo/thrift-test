/*
 *  Copyright © Nekojarashi Inc. All Rights Reserved.
 */

import thrift.sample.*;
import java.net.InetSocketAddress;
import org.apache.thrift.TException;
import org.apache.thrift.transport.TTransport;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.server.THsHaServer.Args;
import org.apache.thrift.server.TServer;
import org.apache.thrift.server.TSimpleServer;
import org.apache.thrift.transport.TNonblockingServerTransport;
import org.apache.thrift.transport.TServerSocket;
import org.apache.thrift.transport.TServerTransport;

/**
 *
 * @author y-okubo
 */
public class ThriftServer {

    public static AwesomeServiceHandler handler;

    public static AwesomeService.Processor processor;

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // thrift-0.9.3.exe -out ThriftClient\src --gen java:fullcamel nekojarashi.thrift
        start();
    }

    public static void start() {
        try {
            handler = new AwesomeServiceHandler();
            processor = new AwesomeService.Processor(handler);

            Runnable simple = new Runnable() {
                public void run() {
                    simple(processor);
                }
            };
            new Thread(simple).start();
        } catch (Exception x) {
            x.printStackTrace();
        }
    }

    public static void simple(AwesomeService.Processor processor) {
        try {
            TServerTransport serverTransport = new TServerSocket(new InetSocketAddress("127.0.0.1", 9090));
            TServer server = new TSimpleServer(new TServer.Args(serverTransport).processor(processor));

            // Use this for a multithreaded server
            // TServer server = new TThreadPoolServer(new TThreadPoolServer.Args(serverTransport).processor(processor));
            System.out.println("Starting the simple server...");
            server.serve();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
