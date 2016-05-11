//Generic Class: l aparola chiave EXPORT permette di includere l'oggetto in un altro file come modulo esterno  
export class User {
	fullname: string;
	constructor(firstname: string, lastname: string) {
		this.fullname = firstname + ' ' + lastname;
	}
	hello(): string {
		return 'Hello, ' + this.fullname;
	}
	otherFunction(): void {
		var list: number[] = [1, 2, 3];		//Array
		
		enum Color { Red, Green, Blue };	//Enum
		var c: Color = Color.Green;

	}
}
/*
var user = new User('Ale','Fal');
alert(user.hello());
*/
//Extends
class Animal {
	name: string;
	constructor(theName: string) { this.name = theName; }
	move(meters: number = 0) {
		alert(this.name + " moved " + meters + "m.");
	}
}
class Snake extends Animal {
	constructor(name: string) { super(name); }
	move(meters = 5) {
		alert("Slithering…");
		super.move(meters);
	}
}
class Horse extends Animal {
	constructor(name: string) { super(name); }
	move(meters = 45) {
		alert("Galloping…");
		super.move(meters);
	}
}
/*
var sam = new Snake("Sammy the Python");
var tom: Animal = new Horse("Tommy the Palomino");
sam.move();
tom.move(34);
*/
//Private method
class Person {
	private _password: string;
	get password(): string {
		return this._password;
	}
	set password(p: string) {
		if (p != "123456") {
			this._password = p;
		}
		else {
			alert("Hey, the password can not be: 123456");
		}
	}
}
/*
var p = new Person();
p.password = "123456"; //shows the error
*/
//Static Methods
class SystemAlert {
	static alert(message: string): void {
		alert(message);
	}
	static warm(message: string): void {
		alert("Atention: " + message);
	}
	static error(message: string): void {
		alert("Error: " + message);
	}
}
/*
SystemAlert.alert("Hi");
SystemAlert.error("It was not possible to connect to the database");
*/
//Interfaces
interface Point {
	x: number;
	y: number;
	z: number;
}

class point3d implements Point {
	x: number = 10;
	y: number = 20;
	z: number = 30;
}

//Parameters in JSON format
class Point2 {
	private _x: number = 0;
	private _y: number = 0;
	private _z: number = 0;
	constructor(p: { x: number; y: number; z?: number; }) {
		this._x = p.x;
		this._y = p.y;
		if (p.z)
			this._z = p.z;
	}
	is3d(): boolean {
		return this._z != 0;
	}
}
/*
var p1 = new Point2({ x: 10, y: 20 });
alert(p1.is3d()); //false
*/