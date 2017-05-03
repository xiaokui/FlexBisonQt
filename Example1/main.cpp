
#include <QtCore>

// This header is generated by Flex.
//#include "lexer.h"

// This header is generated by bison.
//#include "parser.h"

#include "base.h"

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    yyin = fopen("00.txt" , "r");

    yylex();



    fclose(yyin);

    /*
    QString str("{'one': 1,"
                "\"two\": '2',"
                "\"'3'\": [3.14, 10, [7, 8], \"\\\"quoted string\\\"\"],"
                "'4': size(640, 480),"
                "'date': dateTime(date(2013, 2, 27), time(12, 0)),"
                "'number count': {'1': 1, '2': 2, '3': 3}}");

    // Insert the string into the input stream.
    YY_BUFFER_STATE bufferState = yy_scan_string(str.toUtf8().constData());

    // Parse the string.
    yyparse();

    // flush the input stream.
    yy_delete_buffer(bufferState);

    */

    return app.exec();
}



