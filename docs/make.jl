using Sonic
using Documenter

makedocs(;
    modules=[Sonic],
    authors="Amga Baatarjav <amgalan_amg@yahoo.com> and contributors",
    repo="https://github.com/AmgalanB/Sonic.jl/blob/{commit}{path}#L{line}",
    sitename="Sonic.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://AmgalanB.github.io/Sonic.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/AmgalanB/Sonic.jl",
)
