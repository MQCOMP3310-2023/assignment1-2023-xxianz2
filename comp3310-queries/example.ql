/**
 * @name Comp3310 workshop 6 query
 * @kind problem
 * @problem.severity warning
 * @id java/example/empty-block
 */


import java

// Exercise A.1.9
from MethodAccess ma
where 
ma.getNumArgument() = 0 and
ma.getMethod().hasName("printStackTrace") and 
ma.getMethod().getDeclaringType().hasQualifiedName("java.lang", "Throwable")
select ma, "This code calls printStackTrace() on a Throwable without arguments."

___

import java
// Exercise A.1.10
from MethodAccess print, MethodAccess getMessage
where
    print.getMethod().hasName("println") and
    getMessage.getMethod().hasName("getMessage") and
    getMessage.getMethod().getDeclaringType().hasQualifiedName("java.lang", "Throwable") and
    print.getMethod().getDeclaringType().hasQualifiedName("java.io", "PrintStream") and
    print.getAChildExpr*() = getMessage
select print, "This code prints a Throwable's message using System.out.println()."

___

import java
// Exercise A.1.11
from MethodAccess ma, MethodAccess getMessage
where
  (
    ma.getNumArgument() = 0 and
    ma.getMethod().hasName("printStackTrace") and 
    ma.getMethod().getDeclaringType().hasQualifiedName("java.lang", "Throwable")
  ) or (
    ma.getMethod().hasName("println") and
    getMessage.getMethod().hasName("getMessage") and
    getMessage.getMethod().getDeclaringType().hasQualifiedName("java.lang", "Throwable") and
    ma.getMethod().getDeclaringType().hasQualifiedName("java.io", "PrintStream") and
    ma.getAChildExpr*() = getMessage
  )
select ma, "This code prints a Throwable's message using System.out.println()."