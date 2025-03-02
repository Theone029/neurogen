import random
from langchain_openai import ChatOpenAI
from langchain.schema import SystemMessage, HumanMessage

# Initialize the OpenAI model
llm = ChatOpenAI(model_name="gpt-4")

# Basic strategies to test
strategies = [
    "Aggressive risk-taking with high leverage",
    "Moderate risk-taking with diversified portfolio",
    "Conservative risk-taking with low leverage",
]

# Function to generate a response from each strategy
def evaluate_strategy(strategy):
    # Using 'invoke' instead of 'predict_messages' due to deprecation
    response = llm.invoke([
        SystemMessage(content="You are a financial AI strategist. Optimize the following trading strategy:"),
        HumanMessage(content=f"Evaluate and optimize this strategy: {strategy}")
    ])
    return response.content

# Simulate forking of strategies and optimization
def fork_and_optimize():
    optimized_strategies = {}
    for strategy in strategies:
        optimized_strategies[strategy] = evaluate_strategy(strategy)
    return optimized_strategies

# Run the strategy optimization
optimized = fork_and_optimize()
print("Optimized Strategies:", optimized)
