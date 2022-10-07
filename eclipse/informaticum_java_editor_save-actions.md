### Eclipse -> Window -> Preferences -> Java -> Editor -> Save Actions

    [x] Perform the selected actions on save
        [x] Format source code
            (o) Format edited lines
    
    [x] Organize imports
    
    [x] Additional actions: [Configure...]
    
        "Code Organizing" -> "Formatter"
            [x] Remove trailing whitespace
                (o) All lines
            [x] Correct indentation
    
        "Code Organizing" -> "Members"
            [ ] Sort members
    
        "Code Style" -> "Control statements"
            [x] Use block in if/while/for/do statements
                (o) Always
            [x] Combine nested 'if' statement in 'else' block to 'else if'
            [ ] Reduce indentation when possible
            [x] Convert if/else if/else chain with 3 blocks min to switch
            [x] Add elements in collections without loop
    
        "Code Style" -> "Expressions"
            [x] Use parentheses in expressions
                (o) Always
            [ ] Extract increment/decrement from statement
            [ ] Pull up assignment
            [x] Use instanceof keyword instead of Clas.isInstance()
    
        "Code Style" -> "Number literals"
            [x] Use uppercase for long literal suffix
    
        "Code Style" -> "Variable declarations"
            [x] Use modifier 'final' where possible
                [x] Private fields  [x] Parameter  [x] Local variables
    
        "Code Style" -> "Functional interface instances"
            [x] Simplify lambda expression and method reference syntax
    
        "Duplicate code" -> "Duplicate code"
            [x] Factorize operands
            [x] Replace (X && Y) || (!X && Z) by X ? Y : Z
            [ ] Use '==' or '^' on booleans
            [x] Merge conditions of if/else if/else that have the same blocks
            [x] Pull down common code from if/else statement
            [x] Single 'if' statement rather than duplicated blocks that fall through
            [ ] Remove redundant end block with jump statement
            [ ] Remove redundant if condition
            [x] Pull out a duplicate 'if' from an 'if/else'
    
        "Java Feature" -> "Java 16"
            [x] Pattern matching for instanceof
    
        "Java Feature" -> "Java 15"
            [x] Convert String concatenation to Text Block
    
        "Java Feature" -> "Java 14"
            [x] Convert to switch expression
    
        "Java Feature" -> "Java 10"
            [x] Use local variable type inference
    
        "Java Feature" -> "Java 8"
            [x] Convert functional interface instances
                (o) Use lambda where possible
            [x] Use Comparator.comparing()
            [x] Use String.join() when possible
    
        "Java Feature" -> "Java 7"
            [x] Use try-with-resource
            [x] Use Multi-catch
            [x] Use diamond operator
            [x] Use Object.hash()
            [x] Use Object.equals() in the equals method implementation
            [x] Replace system property with constant
                [x] File separator  [x] Path separator    [x] Line separator
                [x] File encoding   [x] Boxed type property
    
        "Java Feature" -> "Java 5"
            [x] Convert to enhanced 'for' loops
                [ ] Only if loop variable used
            [ ] Use Autoboxing
            [ ] Use Unboxing
    
        "Member Accesses" -> "Non static accesses"
            [x] Use 'this' qualifier for field accesses
                (o) Always
            [x] Use 'this' qualifier for method accesses
                (o) Always
    
        "Member Accesses" -> "Static accesses"
            [x] Use declaring class as qualifier
                [ ] Qualify field accesses
                [ ] Qualify method accesses
                [ ] Change all accesses through subtypes
                [x] Change all accesses through instances
    
        "Missing Code" -> "Annotations"
            [x] Add missing Annotations
                [x] '@Override'
                    [x] Implementations of interface methods (1.6 or higher)
                [x] '@Deprecated'
    
        "Performance" -> "Performance"
            [ ] Convert fields into local variables if the use is only local
            [x] Exit loop earlier
            [x] Make inner classes static where possible
            [x] Replace String concatenation by StringBuilder
            [x] Use String.replace() instead of String.replaceAll() when possible
            [x] String.isBlank() rather than String.strip().isEmpty()
            [x] Use lazy logical operator
            [x] valueOf() rather than instantiation
            [x] Primitive comparison
            [x] Primitive parsing
            [x] Primitive serialization
            [x] Primitive type rather than wrapper class
            [x] Precompile reused regular expressions
            [x] Use StringBuilder instead of StringBuffer
                [ ] Only for local variables
            [x] Remove redundant string creation
            [x] Prefer boolean literals
    
        "Source Fixing" -> "Code standardization"
            [x] Avoid Object.equals() or String.equalsIgnoreCase() on null objects
            [x] Compare to zero
            [x] Compare with !=0 for bitwise expressions
    
        "Unnecessary Code" -> "Unused code"
            [ ] Remove unused imports
            [ ] Remove unused private members
            [ ] Remove unused private method parameter
            [ ] Remove unused local variables
    
        "Unnecessary Code" -> "Unnecessary code"
            [x] Remove unnecessary casts
            [x] Remove unnecessary '$NON-NL$' tags
            [x] Remove redundant String.substring() parameter
            [x] Use Arrays.fill() when possible
            [x] Evaluate without null check
            [x] Push down negation
            [x] Boolean value rather than comparison
            [x] Avoid double negation
            [x] Remove redundant comparison statement
            [x] Remove redundant super() call in constructor
            [ ] Remove unreachable block
            [x] Operate on Maps directly
            [x] Initialize collection at creation
            [x] Initialize map at creation
            [x] Remove overridden assignment
                [x] Move declaration if necessary
            [ ] Remove redundant modifiers
            [x] Raise embedded if into parent if
            [x] Remove redundant semicolons
            [x] Use implicit comparator when possible
            [x] Remove unnecessary array creation (1.5 or higher)
            [x] Create array with curly when possible
            [x] Remove variable assignment before return
            [x] Remove useless return
            [x] Remove useless continue
            [ ] Convert loop into if when possible
