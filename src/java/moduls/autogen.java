/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package moduls;

/**
 *
 * @author Deepamala
 */
public class autogen {

    public autogen() {
        runlk();
    }

    static String code, messge;

    public static void runlk() {
//        long l = System.nanoTime();
//        int qwe;
        try {
            for (int i = 10000; i > 0; i--) {

//            System.out.println(qwe);
            }
        } finally {
            long l1 = System.nanoTime();
            System.out.println(l1);
            try {
                String s = String.valueOf(l1);
//              forgetpassword_1 f = new forgetpassword_1();
                code = s.substring(s.length() - 6, s.length());
                messge = "Your Scurty Code IS :" + code;

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    public static String getCode() {
        return code;
    }

    public static String getMessge() {
        return messge;
    }

}
