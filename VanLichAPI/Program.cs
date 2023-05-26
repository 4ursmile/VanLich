using VanLichAPI.Models.Databases;
using VanLichAPI.Services;
using VanLichAPI.Services.Models;
var builder = WebApplication.CreateBuilder(args);
// Add database services to the container.
{
    builder.Services.Configure<VanLichDatabaseSettings>(
            builder.Configuration.GetSection("VanLichDatabase")
        );
    builder.Services.AddSingleton<VanLichDbServices>();
    builder.Services.AddControllers()
    .AddJsonOptions(
        options => options.JsonSerializerOptions.PropertyNamingPolicy = null);
    
}
{
    builder.Services.AddMvc(options => {
        options.SuppressAsyncSuffixInActionNames = false;
    });
    builder.Services.AddSingleton<ContentServices>();

    builder.Services.AddScoped<CommentServices>();
    builder.Services.AddScoped<CollectionServices>();
}
// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
// builder.Services.AddEndpointsApiExplorer();
// builder.Services.AddSwaggerGen();

var app = builder.Build();

// // Configure the HTTP request pipeline.
// if (app.Environment.IsDevelopment())
// {
//     app.UseSwagger();
//     app.UseSwaggerUI();
// }

{
    //app.UseHttpsRedirection();
    app.UseRouting();
    //app.UseAuthorization();

    app.MapControllers();

    app.Run();

}