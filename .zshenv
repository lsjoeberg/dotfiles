# --- Application Specific Variables ------------------------------------------

# go
export GOPATH="${HOME}/go"
export GOBIN="${GOPATH}/bin"

# java
export JAVA_HOME="/usr/lib/jvm/java-1.11.0-openjdk-amd64"

# spark
export SPARK_HOME="/usr/local/spark"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/hadoop/lib/native"

# --- Path --------------------------------------------------------------------

PATH="${PATH}:${HOME}/bin:${HOME}/.local/bin"

# go
PATH="${PATH}:/usr/local/go/bin"
PATH="${PATH}:${GOBIN}"

# *conda
PATH="${PATH}:${HOME}/miniconda/bin"

# java
PATH="${PATH}:${JAVA_HOME}/bin"

# julia
PATH="${PATH}:${HOME}/julia/bin"

export PATH
