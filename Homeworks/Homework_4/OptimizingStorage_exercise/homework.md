### Install sol2uml
The following installation assumes Node.js has already been installed which comes with Node Package Manager (NPM). sol2uml works with node 14 or above.

To install globally so you can run sol2uml from anywhere

```
npm link sol2uml --only=production
```

To upgrade run
```
npm upgrade sol2uml -g
```

To see which version you are using
```
npm ls sol2uml -g
sol2uml --version
```

#### Take Store.sol
#### Use the sol2uml tool to find out how many storage slots it is using.

Commands to generate UML images about the class and slots used in memory from the none-optimized contract (Store.sol)
```
sol2uml storage ./ -c Store -f png
sol2uml class ./ -c Store -f png -o Store-class
```

Commands to generate UML images about the class and slots used in memory from the optimized contract (StoreOptimized.sol)
```
sol2uml storage ./ -c StoreOptimized -f png
sol2uml class ./ -c StoreOptimized -f png -o StoreOptimized-class
```

#### By re ordering the variables, can you reduce the number of storage slots needed ?
Yes. Reducing slots from 0-60 to 0-44
