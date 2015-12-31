import std.stdio;
import std.algorithm;
import std.range;
import std.random;
import std.ascii;
import std.conv;
import std.string;

const ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
void main(string[] args)
{
	string plain = "";
	{
		string tmp;
		while((tmp = readln) !is null){
			plain ~= tmp;
		}
	}

	int[] key = iota(uppercase.length).map!(to!int).array;
	if(args.length == 1){
		randomShuffle(key);
	} else {
		key = keygen(args[1]);
	}
	key.writeln;
}

int[] keygen(string phrase){
	return phrase
		.toUpper
		.array
		.filter!(c => (uppercase.indxOf(c.to!string) != -1))
		.map!(c => uppercase.indexOf(c.to!string).to!int);
}
