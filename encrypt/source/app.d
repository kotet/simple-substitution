import std.stdio;
import std.algorithm;
import std.range;
import std.random;
import std.ascii;
import std.conv;
import std.array;
import std.string;

void main(string[] args)
{
	string key;
	if(args.length == 1){
		"引数が足りません\n
			Usage: ./encrypt {KEYPHRASE}".writeln;
		return;
	} else {
		key = keygen(args[1]);
	}

	string plain = "";
	{
		string tmp;
		while((tmp = readln) !is null){
			plain ~= tmp;
		}
	}
	key.writeln;
}

string keygen(string phrase){
	string tmp = phrase.toUpper
		.filter!(c => ((cast(string)uppercase).indexOf(c.to!string) != -1))
		.map!(c => c.to!string)
		.array.join ~ uppercase;
	string result;
	foreach(i,c;tmp){
		if(tmp.indexOf(c) == i){
			result ~= c;
		}
	}
	return result;
}
