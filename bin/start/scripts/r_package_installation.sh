# Check if R is installed
if ! command -v R &> /dev/null; then
    echo "R is not installed. Please install R on your system."
    exit 1
fi

# Attempt to install required R packages
Rscript -e 'install.packages("requiRements")' || echo "Failed to install requiRements package"
Rscript -e 'install.packages("devtools")' || echo "Failed to install devtools package"

# Run R installation script
Rscript ./install.r || echo "Failed to run R installation script"
