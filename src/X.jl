module Y
    print(" Y here")
end

module Z
    print(" Z here")
end

module X
    using Reexport
    @reexport using Y
    # all of Y's exported symbols available here
    @reexport using Z: x, y
    # Z's x and y symbols available here
end

using X
# all of Y's exported symbols and Z's x and y also available here
