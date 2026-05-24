import java.util.Scanner;
abstract public class ProgrammingLang {
	
	
	Scanner scanner = new Scanner(System.in);
	public String name = scanner.next()
	abstract void describe() { 
		
	}
}

class ProceduralLang extends ProgrammingLang {
	public void describe() {
		System.out.println(name + "is procedural language.")
	}

}

class ObjectOrientedLang extends ProgrammingLang {
	
	public void describe() {
		System.out.println(name + "is an object-oriented language.")
	}
}

class ScriptLang extends ProgrammingLang {
	void describe() {
		System.out.println(name + "is a script language.")
	}
}

public class quiz_202012349 ¹Ú¼ºÀ± {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("procedural language: ")
		public String procedural language = scanner.next();
		ProceduralLang.procedural language = new ProceduralLang()
		
		System.out.println("object-oriented language: ")
		public String object-oriented language = scanner.next();
		ObjectOrientedLang.object-oriented language = new ObjectOrientedLang();
		
		System.out.println("script language: ")
		public String script language = scanner.next();
		ScriptLang.script language = new ScriptLang();
		
		procedural language.describe()
		object-oriented language.describe()
		script language.describe()
		
		
	}
}