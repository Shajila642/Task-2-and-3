library(ggplot2)

# Read the data from the compressed file
gene_data <- read.table(gzfile("/home/user/Downloads/task1/Homo_sapiens.gene_info.gz"), header = TRUE, sep = "\t", quote = "", comment.char = "")

# Remove rows with ambiguous chromosome values and filter out "MN"
gene_data <- gene_data[!grepl("\\|", gene_data$chromosome) & gene_data$chromosome != "MN", ]

# Define the order of chromosomes
chromosome_order <- c(1:22, "X", "Y", "MT", "Un")

# Plot the number of genes per chromosome
ggplot(gene_data, aes(x = factor(chromosome, levels = chromosome_order))) +
  geom_bar(stat = "count", fill = "grey70") +
  labs(title = "Number of Genes in each chromosome",
       x = "Chromosomes",
       y = "Gene count") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 0, hjust = 1),  # Set angle to 0 for horizontal labels
    plot.title = element_text(hjust = 0.5),  # Center the title
    panel.grid.major = element_blank(),  # Hide major grid lines
    panel.grid.minor = element_blank(),  # Hide minor grid lines
    panel.border = element_blank(),  # Hide panel border
    axis.line = element_line(color = "black"),  # Add axis line
    axis.ticks = element_blank(),  # Hide tick marks
    axis.text.y = element_text(size = 8, vjust = 0.5),  # Adjust font size and position of y-axis labels
    axis.ticks.x = element_line(color = "black"),  # Add tick marks for x-axis
    axis.ticks.y = element_line(color = "black")  # Add tick marks for y-axis
  )

# Save the plot to a PDF file
ggsave("genes_per_chromosome_plot.pdf", width = 10, height = 6)
