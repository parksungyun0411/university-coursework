import java.util.Scanner;

abstract class ProgrammingLang {
    public String name;
    abstract void describe();
}

class ProceduralLang extends ProgrammingLang {
    public void describe() {
        System.out.println(name + " is procedural language.");
    }
}

class ObjectOrientedLang extends ProgrammingLang {
    public void describe() {
        System.out.println(name + " is an object-oriented language.");
    }
}

class ScriptLang extends ProgrammingLang {
    public void describe() {
        System.out.println(name + " is a script language.");
    }
}

public class quiz_ProgrammingLang {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("procedural language: ");
        ProceduralLang procedural = new ProceduralLang();
        procedural.name = scanner.next();

        System.out.print("object-oriented language: ");
        ObjectOrientedLang objectOriented = new ObjectOrientedLang();
        objectOriented.name = scanner.next();

        System.out.print("script language: ");
        ScriptLang script = new ScriptLang();
        script.name = scanner.next();

        procedural.describe();
        objectOriented.describe();
        script.describe();
    }
}
