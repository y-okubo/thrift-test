/*
 *  Copyright © Nekojarashi Inc. All Rights Reserved.
 */

import thrift.sample.*;
import java.net.InetSocketAddress;
import org.apache.thrift.protocol.TJSONProtocol;
import org.apache.thrift.server.TServer;
import org.apache.thrift.server.TSimpleServer;
import org.apache.thrift.transport.TServerSocket;
import org.apache.thrift.transport.TServerTransport;

/**
 *
 * @author y-okubo
 */
public class Server {

    public static Handler handler;

    public static AwesomeService.Processor processor;

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        start();
    }

    public static void start() {
        try {
            handler = new Handler();
            processor = new AwesomeService.Processor(handler);

            Runnable simple = () -> {
                simple(processor);
            };
            new Thread(simple).start();
        } catch (Exception x) {
            x.printStackTrace();
        }
    }

    public static void simple(AwesomeService.Processor processor) {
        try {
            TServerTransport serverTransport = new TServerSocket(new InetSocketAddress("127.0.0.1", 9090));
            TServer server = new TSimpleServer(new TServer.Args(serverTransport).processor(processor).protocolFactory(new TJSONProtocol.Factory()));

            System.out.println("Starting the simple server...");
            server.serve();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
